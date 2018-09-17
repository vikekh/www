FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 55170
EXPOSE 44383

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY src/Vikekh.Www.Web/Vikekh.Www.Web.csproj src/Vikekh.Www.Web/
COPY src/Vikekh.Www.Core/Vikekh.Www.Core.csproj src/Vikekh.Www.Core/
RUN dotnet restore src/Vikekh.Www.Web/Vikekh.Www.Web.csproj
COPY . .
WORKDIR /src/src/Vikekh.Www.Web
RUN dotnet build Vikekh.Www.Web.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish Vikekh.Www.Web.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Vikekh.Www.Web.dll"]
#ASPNETCORE_ENVIRONMENT=Development
#ASPNETCORE_URLS=https://+:443;http://+:80
#ASPNETCORE_HTTPS_PORT=44383
