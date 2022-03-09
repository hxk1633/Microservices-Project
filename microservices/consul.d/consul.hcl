datacenter = "dc1"
server = true
data_dir = "/var/lib/consul/"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
bootstrap = true
bootstrap_expect = 1

ui_config {
    enabled = true
}

enable_syslog = true
log_level = "INFO"