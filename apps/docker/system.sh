#!/bin/bash
host-info() {
	docker system info --format '{{.OSType}}/{{.Architecture}}'
}
monitor() {
	docker stats
}
"$@"
