# Variables
CONFIG_FILE := config.yaml
ZONE := example.com.
#ZONE := teckl.xyz.
#ZONE := teckl.org.
include ./env/.env
export
EXTRA_OPTS :=

# Default help task
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  dump           - Alias to dump-cloudflare"
	@echo "  dump-cloudflare - Dump DNS records from Cloudflare"
	@echo "  dump-route53    - Dump DNS records from Route53"
	@echo "  sync           - Sync DNS records using the configuration file"
	@echo "  validate       - Validate the configuration file"

# Dump DNS records
.PHONY: dump
dump: dump-cloudflare

# Dump DNS records for Cloudflare
.PHONY: dump-cloudflare
dump-cloudflare:
	@echo "Dumping DNS records from provider: cloudflare"
	octodns-dump --config-file=$(CONFIG_FILE) --output-dir=zones/  $(ZONE) cloudflare $(EXTRA_OPTS)

.PHONY: dump-route53
dump-route53:
	@echo "Dumping DNS records from provider: route53"
	octodns-dump --config-file=$(CONFIG_FILE) --output-dir=zones_route53/  $(ZONE) route53 $(EXTRA_OPTS)

# Sync DNS records
.PHONY: sync
sync:
	@echo "Syncing DNS records using configuration: $(CONFIG_FILE)"
	octodns-sync --config-file=$(CONFIG_FILE) $(EXTRA_OPTS)

# Validate configuration
.PHONY: validate
validate:
	@echo "Validating configuration file: $(CONFIG_FILE)"
	octodns-validate --config-file=$(CONFIG_FILE)
