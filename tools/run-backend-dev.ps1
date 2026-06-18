$root = Split-Path -Parent $PSScriptRoot
$jarPath = Join-Path $root 'target\bankingportal-0.0.1-SNAPSHOT.jar'
$dataDir = Join-Path $root 'dev-data'

New-Item -ItemType Directory -Force $dataDir | Out-Null

java -jar $jarPath `
  --server.port=8180 `
  "--spring.datasource.url=jdbc:h2:file:C:/BankingPortal/SmartBank-Pro-main/dev-data/bankingapp;MODE=MySQL;NON_KEYWORDS=USER" `
  --spring.datasource.driver-class-name=org.h2.Driver `
  --spring.datasource.username=sa `
  --spring.datasource.password= `
  --spring.jpa.database-platform=org.hibernate.dialect.H2Dialect `
  --spring.jpa.hibernate.ddl-auto=update `
  --spring.main.allow-circular-references=true `
  --jwt.secret=bG9jYWwtZGV2LXNlY3JldC1rZXktbG9jYWwtZGV2LXNlY3JldC1rZXktbG9jYWwtZGV2LXNlY3JldC1rZXktMTIzNDU2Nzg5MA== `
  --jwt.expiration=86400000 `
  --geo.api.url=https://api.findip.net/ `
  --geo.api.key=local-dev `
  --spring.mail.host=localhost `
  --spring.mail.port=2525 `
  --spring.mail.username=dev@localhost `
  --spring.mail.properties.mail.smtp.auth=false `
  --spring.mail.properties.mail.smtp.starttls.enable=false
