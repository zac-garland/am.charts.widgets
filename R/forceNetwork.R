#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
forceNetwork <- function(data = jsonlite::parse_json(sys_file("extdata/forceData.json") |> readLines() |> paste(collapse = "")), width = NULL, height = NULL, elementId = NULL) {

  # data <- jsonlite::toJSON(x = data,
  #                          dataframe = "columns", null = "null", na = "null", auto_unbox = TRUE,
  #                          digits = getOption("shiny.json.digits", 16), use_signif = TRUE, force = TRUE,
  #                          POSIXt = "ISO8601", UTC = TRUE, rownames = FALSE, keep_vec_names = TRUE,
  #                          json_verabitm = TRUE
  # )

  # forward options using x
  x = list(
    data = data
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'forceNetwork',
    x,
    width = width,
    height = height,
    package = 'am.charts.widgets',
    elementId = elementId
  )
}

#' Shiny bindings for forceNetwork
#'
#' Output and render functions for using forceNetwork within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a forceNetwork
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name forceNetwork-shiny
#'
#' @export
forceNetworkOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'forceNetwork', width, height, package = 'am.charts.widgets')
}

#' @rdname forceNetwork-shiny
#' @export
renderForceNetwork <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, forceNetworkOutput, env, quoted = TRUE)
}
