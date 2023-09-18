## dotnet-cli webapi 

- The simplest way to create a new webapi project is to use the dotnet-cli. 
- The dotnet-cli is a command line tool that is installed with the .NET Core SDK.



## How to install dotnet core on Windows
- Download and install the latest .NET Core SDK from https://dotnet.microsoft.com/download

![](dotnet-sdk.jpg)



## Verify the installation

```powershell
dotnet --version
```

## list all installed SDKs
```powershell
dotnet --list-sdks
```



## dotnet new webapi from scratch (first time only)
```powershell	
dotnet new webapi  --name projectName  --no-update-check --framework net6.0  --no-restore  --no-https  --dry-run
```


## How to restore packages
```powershell   
dotnet restore
```

## How to build
```powershell
dotnet build
```

## How to run
```powershell
dotnet run
```

## How to test
```powershell   
dotnet test
```

## How to Call the API from a browser 
- http://localhost:5132/swagger/index.html 
- http://localhost:5132/WeatherForecast
