FROM mcr.microsoft.com/dotnet/core/sdk
COPY WebApiTest/bin/Debug/netcoreapp2.2/publish .
WORKDIR .
EXPOSE 8990
ENTRYPOINT ["dotnet", "WebApiTest.dll"]
