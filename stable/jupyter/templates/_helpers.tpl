{{/* vim: set filetype=mustache: */}}

{{/*
Create fully qualified names.
*/}}

{{- define "jupyter.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "jupyter.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "jupyter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "jupyter.jobexecutor" -}}
{{- printf "%s-%s" .Release.Name .Values.permissions.jobExecutor.name -}}
{{- end -}}

{{- define "jupyter.basicjobexecutor" -}}
{{- printf "%s-%s" .Release.Name .Values.permissions.basicJobExecutor.name -}}
{{- end -}}

{{- define "jupyter.mpijobexecutor" -}}
{{- printf "%s-%s" .Release.Name .Values.permissions.mpiJobExecutor.name -}}
{{- end -}}

{{- define "jupyter.sparkjobexecutor" -}}
{{- printf "%s-%s" .Release.Name .Values.permissions.sparkJobExecutor.name -}}
{{- end -}}

