# Run this script one line at a time 


########################################################################################
# Docker Configuration as Code 
########################################################################################

function docker-container-remove-all {
    docker container rm $(docker container ls -aq) -f
}

function docker-image-remove-unused {
    docker image prune --force
}

function docker-image-remove-all {
    docker image rm $(docker image ls -aq) -f  
}

function docker-reset {
    docker-container-remove-all
    docker-image-remove-all
    docker-image-remove-unused
}


# Ensure windows is in a clean state No containers or images should be running or available 
docker-reset

# Download the latest SQL Server 2019 image from Microsoft Container Registry
docker run -d --name sqlserver -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Password123" -p 1433:1433 mcr.microsoft.com/mssql/server:2019-latest

# Verify the docker container is running 
docker ps -a












########################################################################################
# SQLCMD Configuration as Code 
########################################################################################

# Connect to the SQL Server container instance 
sqlcmd -S localhost,1433 -U sa -P Password123 -i .\setup_database.sql

# Verify the database and table were created successfully
sqlcmd -S localhost,1433 -U sa -P Password123 -Q "SELECT count(*) as [TestCount]  FROM [StudentDB].[dbo].[StudentDetails]"













########################################################################################
# Environment Configuration as Code 
########################################################################################


function env-list { dir env:\$args }

function env-set {
    param($Name, $Value)
   
    $ErrorActionPreference = 'SilentlyContinue'
    $isCloudShell = uname 
    if ($isCloudShell) {
        [Environment]::SetEnvironmentVariable($Name, $Value)
    } else {
        [Environment]::SetEnvironmentVariable($Name, $Value, 'User')
    }
}

function env-get {
    param($Name)
  
    $ErrorActionPreference = 'SilentlyContinue'
    $isCloudShell = uname 
    if ($isCloudShell) {
        [Environment]::GetEnvironmentVariable($Name)
    } else {
        [Environment]::GetEnvironmentVariable($Name, 'User')
    }
}



# Ensure the connection string is stored in the environment variable dbConnection 
env-set -Name "dbConnection" -Value "Data Source=localhost;Initial Catalog=StudentDB;User ID=sa;Password=Password123;Trust Server Certificate=True"

# Verify the connection string is stored in the environment variable dbConnection
env-get -Name "dbConnection"

