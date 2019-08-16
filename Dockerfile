FROM mcr.microsoft.com/dotnet/core/sdk
COPY WebApiTest/bin/Debug/netcoreapp2.2/publish .
WORKDIR .
EXPOSE 9098
ENTRYPOINT ["dotnet", "WebApiTest.dll"]
