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
        ## Process the numbers
        if(length(numbersindex) == 1){
            ## In the case one number available, suppose it seconds
            secdiff <- textwithdiff[numbersindex]
        } else {
            if(length(numbersindex) == 2){
                ## If two numbers available maybe mins and seconds
                minsinsec <- as.numeric(textwithdiff[numbersindex[1]]) * 60
                secdiff <- minsinsec + as.numeric(textwithdiff[numbersindex[2]])
            } else {
                if(length(numbersindex) == 0){
                    secdiff <- NA
                } else {
                    warning("More than two numbers are in the text!")
                    secdiff <- NA
                }
            }
        }
        secdiff
    }
    ## Read in file as character
    rawnote <- scan(file, character(), sep="\n", enc = "latin1")
    ## Split file at spaces
    splittednote <- strsplit(rawnote, " ")
    ## Process resulted list
    datetime <- sapply(splittednote, processreadoutdate)
    timediff <- sapply(splittednote, processdiff)
    data.frame(datetime, timediff = as.numeric(timediff))
}

preparenote(ttfiles[1])
