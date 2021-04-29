FROM hashicorp/terraform:0.12.29

RUN addgroup -S ubuntu && adduser -u 1000 -S ubuntu -G ubuntu

ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY

ADD entrypoint.sh /entrypoint.sh
ADD RunTerraformScript.ps1 /RunTerraformScript.ps1
ADD main.tf /tf/main.tf
ADD Variables.tf /tf/Variables.tf

RUN chmod +x /entrypoint.sh
RUN chmod +x /RunTerraformScript.ps1
RUN chmod +x /tf/main.tf
RUN chmod +x /tf/Variables.tf

ENTRYPOINT ["/entrypoint.sh"]
