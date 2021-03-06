FLAGS := --release
DEPS  := crystal deps
BUILD := crystal build
SPEC  := crystal spec

.PHONY: build deps spec clean

default: all

all: deps build

build:
	mkdir -p bin
	$(BUILD) src/notify.cr -o bin/notify $(FLAGS)
	$(BUILD) src/connpass.cr -o bin/connpass $(FLAGS)
	$(BUILD) src/qiita.cr -o bin/qiita $(FLAGS)
	$(BUILD) src/web_server.cr -o bin/web_server $(FLAGS)

deps:
	$(DEPS)

spec:
	$(SPEC)

clean:
	rm -rf bin
	rm -rf .deps
	rm -rf .shards
	rm -rf .crystal
	rm -rf libs
