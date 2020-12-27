ttfiles <- dir(patt="^Boreas20[12][0-9].txt")

preparenote <- function(file) {
    ## Function to substract readout date from text note
    processreadoutdate  <- function(notetext){
        paste(notetext[1], notetext[2])
    }
    ## Substract time difference from text
    processdiff <- function(notetext){
        textwithdiff <- notetext[3:length(notetext)]
        numbersindex <- grep("[0-9]", textwithdiff)
        textwithdiff[numbersindex[1]]
    }
    ## Read in file as character
    rawnote <- scan(file, character(), sep="\n")
    ## Split file at spaces
    splittednote <- strsplit(rawnote, " ")
    ## Process resulted list
    datetime <- sapply(splittednote, processreadoutdate)
    timediff <- sapply(splittednote, processdiff)
    data.frame(datetime, timediff = as.numeric(timediff))
}

preparenote(ttfiles[1])
