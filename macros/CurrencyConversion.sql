{% macro money_conv(col,dec,cur) %}
{% if cur == 'EUR' %}
round( 0.83 * {{col}} , {{dec}})
{% else %}
round( 0.93 * {{col}} , {{dec}})
{% endif %}
{%endmacro %}