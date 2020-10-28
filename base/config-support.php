#!/usr/bin/env php
<?php

require_once __DIR__.'/../autoload.php';

use Symfony\Component\Process\Process;
use Symfony\Component\Yaml\Yaml;

$roaveBinary = '/composer/vendor/bin/roave-backward-compatibility-check';
$configFile = '/app/roave-bc-check.yaml';

$arguments = $argv;
$arguments[0] = $roaveBinary;

$process = new Process($arguments);
$process->setWorkingDirectory('/app');
$process->setTimeout(null);
$process->run();

if ($process->isSuccessful()) {
    echo $process->getOutput();
    exit($process->getExitCode());
}

if (file_exists($configFile)) {
    echo $process->getErrorOutput();
    exit($process->getExitCode());
}

$errorList = parseErrors($process->getErrorOutput());

$config = Yaml::parseFile($configFile);
foreach ($config['parameters']['ignoreErrors'] ?? [] as $regex) {
    $errorList->removeErrorsMatching($regex);
}

printOutput($errorList);

if (count($errorList->getErrors()) === 0) {
    exit(0);
}

exit($process->getExitCode());

function parseErrors(string $text)
{
    $firstErrorFound = false;
    $output = '';
    $currentError = '';
    $list = [];
    $lines = explode(PHP_EOL, $text);
    foreach ($lines as $line) {
        if (substr($line, 0, 4) === '[BC]') {
            if ($firstErrorFound) {
                $list[] = $currentError;
            }
            $firstErrorFound = true;
            $currentError = $line;
        } elseif (!$firstErrorFound) {
            $output.=$line.PHP_EOL;
        } elseif (substr($line, -39) === 'backwards-incompatible changes detected') {
            $list[] = $currentError;
            break;
        } else {
            $currentError .= $line;
        }
    }

    return new ErrorList($output, $list);
}

class ErrorList {
    private string $output;
    private array $errors;

    public function __construct(string $output, array $error)
    {
        $this->output = $output;
        $this->errors = $error;
    }

    public function getOutput(): string
    {
        return $this->output;
    }

    public function getErrors(): array
    {
        return $this->errors;
    }

    public function removeErrorsMatching(string $regex)
    {
        foreach ($this->errors as $i => $error) {
            if (preg_match($regex, $error)) {
                unset($this->errors[$i]);
            }
        }
    }
}

function printOutput(ErrorList $errorList)
{
    echo $errorList->getOutput().PHP_EOL.PHP_EOL;
    $errors = $errorList->getErrors();

    foreach ($errors as $error) {
        echo $error.PHP_EOL.PHP_EOL;
    }

    echo sprintf('%s backwards-incompatible changes detected', count($errors)).PHP_EOL;
}
