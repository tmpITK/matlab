function main
    %a = [4 3 2 6 5 7 1 11 9 10];
    
    %a = quickSort(a, 1, n);
    %a
    %b = [4 3 2 6 5 7 1 11 9 10];
    %b = insertionSort(b, n);
    %b
    c = [4 3 2 6 5 7 1 11 9 10];
    [m,n] = size(c);
    c = shellSort(c, n);
    c
end

function arr = shellSort(arr, size)
    gap = floor(size / 2);
    while(gap>1)       
        for i = gap:1:size
            v = arr(i);
            j = i;
            while(j>=gap)
                if arr(j-gap+1) < v
                    break;
                end
                arr(j) = arr(j-gap+1);
                j = j - gap + 1;
            end
            arr(j) = v;
        end
        
        gap = floor(gap/2);
    end
end

function arr = insertionSort(arr, size)
    for i = 2:size
        j=i-1; v = arr(i);
        while(j>=1)
            if(arr(j)<=v)
                break
            end
            arr(j+1) = arr(j)
            j = j - 1;
        end
        arr(j+1) = v;
    end
end

function arr = quickSort(arr, from, to)
    if from>=to
        return;
    end
    current = from;
    for i = from:to-1
        if arr(i)<arr(to)
            arr = swap(arr, i, current);
            current = current + 1;
        end
    end
    arr = swap(arr, current, to);
    arr = quickSort(arr, from, current-1);
    arr = quickSort(arr, current+1, to);
    return;
end

function arr = swap(arr, i, j)
    temp = arr(i);
    arr(i) = arr(j);
    arr(j) = temp;
end


