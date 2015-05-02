{
    $0 = tolower($0)
            gsub(/[^[:alnum:]_[:blank:]]/, "", $0)
                for (num = 1; num <= NF; num++)
                            freq[$num]++
}

            END {
                    for (item in freq)
                                printf "%s\t%d\n", item, freq[item]
                }
