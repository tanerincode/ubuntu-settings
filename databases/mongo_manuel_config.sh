# Create a configuration file for MongoDB
echo "systemLog:
  destination: file
  path: /var/log/mongodb/mongod.log
  logAppend: true
storage:
  dbPath: /var/lib/mongo
  journal:
    enabled: true
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile
net:
  port: 27017
  bindIp: 0.0.0.0  # Listen to local interface only, comment to listen on all interfaces.
security:
  authorization: enabled" | sudo tee -a /etc/mongod.conf

# Create a service file for MongoDB
echo "[Unit]
Description=MongoDB Database Server
Wants=network.target
After=network.target

[Service]
ExecStart=/usr/local/bin/mongodb-linux-x86_64-ubuntu2204-6.0.6/bin/mongod --config /etc/mongod.conf
ExecReload=/bin/kill -HUP $MAINPID
Restart=always
User=mongodb
Group=mongodb
StandardOutput=syslog
StandardError=syslog

[Install]
WantedBy=multi-user.target" | sudo tee -a /etc/systemd/system/mongod.service

# Start the MongoDB service
sudo systemctl start mongod

# Enable the MongoDB service to start on boot
sudo systemctl enable mongod
