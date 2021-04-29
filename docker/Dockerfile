FROM hashicorp/terraform:0.14.11

RUN addgroup -S ubuntu && adduser -u 1000 -S ubuntu -G ubuntu

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
