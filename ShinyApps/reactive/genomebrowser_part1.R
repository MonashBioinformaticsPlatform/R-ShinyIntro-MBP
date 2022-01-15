### --------------------------------
### Genome browser challenge, part 1
### --------------------------------
# 
# The following code produces a diagram for a region of a genome. Your
# collaborator is asking you to make diagrams for a whole lot of
# different locations in the genome. Create a Shiny app to create these
# diagrams for them.
# 

library(GenomicRanges)
library(Gviz)
library(rtracklayer)
library(BSgenome.Scerevisiae.UCSC.sacCer3)
library(TxDb.Scerevisiae.UCSC.sacCer3.sgdGene)

genome <- BSgenome.Scerevisiae.UCSC.sacCer3
txdb <- TxDb.Scerevisiae.UCSC.sacCer3.sgdGene

# We want to be able to interactively specify this location:
location <- GRanges("chrI:140000-180000", seqinfo=seqinfo(genome))

axis_track <- GenomeAxisTrack()
seq_track <- SequenceTrack(genome)
gene_track <- GeneRegionTrack(
    txdb, genome=genome, name="Genes", showId=TRUE, shape="arrow")

# Load data, at a reasonable level of detail for width(location)
n <- min(width(location), 1000)
d1 <- rtracklayer::summary(
    BigWigFile("forward.bw"), location, n, "max")[[1]]
d2 <- rtracklayer::summary(
    BigWigFile("reverse.bw"), location, n, "max")[[1]]
data_track <- DataTrack(
    d1, data=rbind(d1$score,-d2$score), groups=c(1,2),
    name="PAT-seq", type="l", col="#000000", legend=FALSE)

plotTracks(
    list(axis_track, seq_track, gene_track, data_track),
    chromosome=as.character(seqnames(location)),
    from=start(location), to=end(location))

# 
# 
#
## ===============
## Updating inputs
## ===============

ui_updater <- fluidPage(
    titlePanel("Updating inputs demonstration"),
    textInput("text", "A text input", "I keep saying"),
    actionButton("button", "A button"))

server_updater <- function(input,output,session) {
    observeEvent(input$button, {
        updateTextInput(session, "text", value=paste(input$text, "without a shirt"))
    })
}

shinyApp(ui_updater, server_updater)