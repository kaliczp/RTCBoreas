ttfiles <- dir(patt="^Boreas20[12][0-9].txt")

preparenote <- function(file) {
    ## Read in file as character
    rawnote <- scan(file, character(), sep="\n")
    ## Split file at spaces
    splittednote <- strsplit(rawnote, " ")
    ## Process resulted list
    sapply(splittednote, function(x){x[1]})
}

preparenote(ttfiles[1])
