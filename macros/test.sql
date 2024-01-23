{% macro ref() %}
-- extract user-provided positional and keyword arguments
  {% set version = kwargs.get('version') %}
  {% set packagename = none %}
  {%- if (varargs | length) == 1 -%}
    {% set modelname = varargs[0] %}
{%- else -%}
    {% set packagename = varargs[0] %}
    {% set modelname = varargs[1] %}
{% endif %}
-- call builtins.ref based on provided positional arguments
{% set rel = None %}
{% if packagename is not none %}
    {% set rel = return(builtins.ref(packagename, modelname, version=version)) %}
{% else %}
    {% set rel = return(builtins.ref(modelname, version=version)) %}
{% endif %}

-- finally, override the database name with "dev"
{% set newrel = rel.replace_path(database="dev") %}
{% do return(newrel) %}

{% endmacro %}