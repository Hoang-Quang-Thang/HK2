setwd('C:\\Users\\RED\\PycharmProjects\\CTDLGT_R')

tower_of_hanoi <- function(n = 7) {
  if (!interactive()) return()
  tower <- list(1:n, NULL, NULL)
  color <- rainbow(n)
  par(mfrow = c(1, 3), mar = rep(0, 4), ann = FALSE)
  bgcolor <- par("bg")
  if (bgcolor == "transparent") bgcolor <- "white"
  
  draw.hanoi <- function() {
    for (i in 1:3) {
      plot(c(-n, n), c(0, n + 2), type = "n", xlab = "",
           ylab = "", axes = FALSE)
      rect(-n, 0, n, n + 2, border = bgcolor, col = bgcolor)
      if (length(tower[[i]]) > 0) {
        barplot(rev(tower[[i]]), add = TRUE, horiz = TRUE,
                col = color[rev(tower[[i]])])
        barplot(-rev(tower[[i]]), add = TRUE, horiz = TRUE,
                col = color[rev(tower[[i]])])
      }
    }
  }
  
  move.hanoi <- function(k, from, to, via) {
    if (k > 1) {
      move.hanoi(k - 1, from, via, to)
      move.hanoi(1, from, to, via)
      move.hanoi(k - 1, via, to, from)
    }
    else {
      cat("Move ", tower[[from]][1], " from ", LETTERS[from],
          " to ", LETTERS[to], "\n")
      tower[[to]] <<- c(tower[[from]][1], tower[[to]])
      tower[[from]] <<- tower[[from]][-1]
      draw.hanoi()
      Sys.sleep(0.5)
    }
  }
  
  draw.hanoi()
  move.hanoi(n, 1, 2, 3)
}

tower_of_hanoi(8)
