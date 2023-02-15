# db-endpoints
A simple docker-compose setup to run oracle and sql server database for easy deployment in the cloud for dev/test.
Note, requires at least t2.medium in AWS (beyond free tier but still cheap) for enough resources to power Oracle.

# Setup
sudo git clone https://github.com/ryvdx/ryvealedgetest.git /var/lin/ryvealedgetest

# Run SQL CMD
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Passw0rd_"
