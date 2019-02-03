VERSIONS := 1.x 2.x latest
BUILD_ALL_VERSIONS := $(addprefix build-, $(VERSIONS))
TEST_ALL_VERSIONS := $(addprefix test-, $(VERSIONS))

all: test

.PHONY: build build-base $(BUILD_ALL_VERSIONS)
build-base:
	docker build -t nyholm/roave-bc-check:base base

$(BUILD_ALL_VERSIONS): build-%: build-base
	docker build -t nyholm/roave-bc-check:$* $*

build: $(BUILD_ALL_VERSIONS)

.PHONY: test $(TEST_ALL_VERSIONS)
$(TEST_ALL_VERSIONS): test-%:
	@echo "Test $*"
	@docker run --rm nyholm/roave-bc-check:$* list

test: build $(TEST_ALL_VERSIONS)
