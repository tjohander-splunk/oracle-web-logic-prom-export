provider "signalfx" {
  auth_token = var.access_token
  api_url    = "https://api.${var.realm}.signalfx.com"
}

resource "signalfx_time_chart" "servlet_execution_time_average" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  disable_sampling          = false
  max_delay                 = 0
  minimum_resolution        = 0
  name                      = "Web Logic Servlet Execution Time Average"
  on_chart_legend_dimension = "servletName"
  plot_type                 = "LineChart"
  program_text              = "A = data('weblogic_servlet_execution_time_average', filter=filter('app', 'spring-petclinic-2.6.0-SNAPSHOT')).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  tags                      = []
  time_range                = 900
  unit_prefix               = "Metric"

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "weblogic_servlet_execution_time_average"
    label        = "A"
  }
}

resource "signalfx_text_chart" "oracle_call_out_text_chart" {
  id       = "FKn1D4BAwAI"
  markdown = <<-EOT
        # Oracle Web Logic Server Metrics
        This metrics that are feeding these panels are being scraped by the OpenTelemetry ("Otel") Collector.  The scrape target is the Web Logic Metrics Exporter that's running on the Web Logic web servers.
    EOT
  name     = "Oracle Web Logic Metrics"
  url      = "https://app.signalfx.com/#/chart/FKn1D4BAwAI"
}

resource "signalfx_time_chart" "jvm_heap_free" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  disable_sampling          = false
  id                        = "FKn1GGeAwAQ"
  max_delay                 = 0
  minimum_resolution        = 0
  name                      = "JVM Heap Free Percent By Server"
  on_chart_legend_dimension = "server"
  plot_type                 = "LineChart"
  program_text              = "A = data('jvm_heap_free_percent').publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  tags                      = []
  time_range                = 900
  unit_prefix               = "Metric"
  url                       = "https://app.signalfx.com/#/chart/FKn1GGeAwAQ"

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "jvm_heap_free_percent"
    label        = "A"
  }
}


resource "signalfx_dashboard" "wlsdemo" {
  charts_resolution = "default"
  dashboard_group   = "FEfuQNVAwAQ"
  description       = "Charts for metrics from Oracle Web Logic and a tenant applicacation"
  id                = "FKn1EYUA0AE"
  name              = "Oracle Web Logic Monitoring"
  time_range        = "-15m"
  url               = "https://app.signalfx.com/#/dashboard/FKn1EYUA0AE"

  chart {
    chart_id = signalfx_text_chart.oracle_call_out_text_chart.id
    column   = 0
    height   = 1
    row      = 0
    width    = 12
  }

  chart {
    chart_id = signalfx_time_chart.servlet_execution_time_average.id
    column   = 0
    height   = 1
    row      = 1
    width    = 6
  }

  chart {
    chart_id = signalfx_time_chart.jvm_heap_free.id
    column   = 6
    height   = 1
    row      = 1
    width    = 6
  }

  chart {
    chart_id = "FKn1EXIA4AE"
    column   = 0
    height   = 1
    row      = 2
    width    = 12
  }
  chart {
    chart_id = "FKn1EbEAwAA"
    column   = 0
    height   = 1
    row      = 3
    width    = 6
  }

  chart {
    chart_id = "FKn1FZRAwAE"
    column   = 6
    height   = 1
    row      = 3
    width    = 6
  }
}
