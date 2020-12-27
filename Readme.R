ttfiles <- dir(patt="^Boreas20[12][0-9].txt")

preparenote <- function(file) {
    ## Function to substract readout date from text note
    processreadoutdate  <- function(notetext){
        paste(notetext[1], notetext[2])
    }
    ## Read in file as character
    rawnote <- scan(file, character(), sep="\n")
    ## Split file at spaces
    splittednote <- strsplit(rawnote, " ")
    ## Process resulted list
    sapply(splittednote, processreadoutdate)
}

preparenote(ttfiles[1])
