#!/bin/bash

helm repo add atlassian-data-center https://atlassian.github.io/data-center-helm-charts
softwares=(jira confluence bitbucket)

for software in ${softwares[@]}; do
    helm pull atlassian-data-center/$software
done