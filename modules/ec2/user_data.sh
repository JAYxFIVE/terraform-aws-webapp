#!/bin/bash
yum update -y
yum install -y httpd

cat > /var/www/html/index.html <<EOF
<html>
<head>
    <title>Terraform Resume Project</title>
</head>
<body>
    <h1>Deployed with Terraform</h1>
    <p>AWS 2-tier web app environment</p>
</body>
</html>
EOF

systemctl enable httpd
systemctl start httpd