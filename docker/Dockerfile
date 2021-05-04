FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build



ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY

ADD entrypoint.sh /entrypoint.sh
ADD RunTerraformScript.ps1 /RunTerraformScript.ps1
ADD main.tf /main.tf
ADD Variables.tf /Variables.tf

RUN chmod +x /entrypoint.sh
RUN chmod +x /RunTerraformScript.ps1
RUN chmod +x /main.tf
RUN chmod +x /Variables.tf

ENTRYPOINT ["/entrypoint.sh"]
