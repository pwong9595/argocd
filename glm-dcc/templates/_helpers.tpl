# (C) Copyright 2021 Hewlett Packard Enterprise Development LP
{{- define "helpers.list-env-variables" }}
{{- range $key, $val := .Values.env.normal }}
- name: {{ $key }}
  value: {{ $val | quote }}
{{- end }}
{{- range $key, $val := .Values.env.secret }}
- name: {{ $key }}
  valueFrom:
    secretKeyRef:
      name: app-env-secret
      key: {{ $key }}
{{- end }}
{{- end }}
