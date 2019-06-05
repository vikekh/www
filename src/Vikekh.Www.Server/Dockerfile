FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY ["src/Vikekh.Www.Server/Vikekh.Www.Server.csproj", "src/Vikekh.Www.Server/"]
COPY ["src/Vikekh.Www.Shared/Vikekh.Www.Shared.csproj", "src/Vikekh.Www.Shared/"]
COPY ["src/Vikekh.Www.Client/Vikekh.Www.Client.csproj", "src/Vikekh.Www.Client/"]
RUN dotnet restore "src/Vikekh.Www.Server/Vikekh.Www.Server.csproj"
COPY . .
WORKDIR "/src/src/Vikekh.Www.Server"
RUN dotnet build "Vikekh.Www.Server.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Vikekh.Www.Server.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Vikekh.Www.Server.dll"]