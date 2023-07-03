# CDSX Demo

## 1. Create CAP project

- Run CLI commands below:

```shell
# initialize CAP project
> cds init
# initialize git
> git init
# install dependencies
> npm install
```

## 2. Add external service

- Import an EDMX file generated from an S/4HANA OData Service, here we are using [API_BUSINESS_PARTNER.xml](template/API_BUSINESS_PARTNER.xml). Copy the file from [template](template) folder to your project folder, then execute the command below:

```shell
> cds import API_BUSINESS_PARTNER.xml
```

## 3. Create CDS models and handlers