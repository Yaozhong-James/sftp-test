require 'net/ssh'
require 'net/sftp'
require 'logger'

logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

def get_env(name)
  ENV[name.to_str] || raise("#{name} is not set")
end

host = get_env("HOST")
username = get_env("USERNAME")
options = { password: get_env("PASSWORD") }

logger.info "Starting SSH connection"
ssh = Net::SSH.start(host, username, {
    auth_methods: ["password"],
    non_interactive: true,
    logger: logger}.merge(options)
)
logger.info "Connected to #{host}"

logger.info "Starting SFTP"
sftp = ssh.sftp.connect!
logger.info "SFTP is open"

logger.info "Opening test-file.yml"
sftp.file.open("test-file.yml", "w") do |f|
  f.write('data')
end
logger.info "Closed test-file.yml"

sftp.close_channel()
ssh.close
