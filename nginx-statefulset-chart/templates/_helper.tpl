{{/*
nginx-statefulset-chart/templates/_helpers.tpl
This file contains helper templates that can be reused across other templates.
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "nginx-statefulset-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If it is too long, we use a hash of it.
*/}}
{{- define "nginx-statefulset-chart.fullname" -}}
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
Create chart name and version as a label.
*/}}
{{- define "nginx-statefulset-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "nginx-statefulset-chart.labels" -}}
helm.sh/chart: {{ include "nginx-statefulset-chart.chart" . }}
{{ include "nginx-statefulset-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "nginx-statefulset-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nginx-statefulset-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
