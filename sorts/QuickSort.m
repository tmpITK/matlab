classdef QuickSort
    %QUICKSORT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Arr;
    end
    
    methods
        function this = QuickSort(inputArg1)
            %QUICKSORT Construct an instance of this class
            %   Detailed explanation goes here
            this.Arr = inputArg1;
            this.Arr;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
        
        function this = swap(this, i, j)
           temp = this.Arr(i);
           this.Arr(i) = this.Arr(j);
           this.Arr(j) = temp;
        end
        function this = sort(this)
            [m,n] = size(this.Arr);
            m
            quickSort(this, 1, n)
        end
        function this = quickSort(this, from, to)
            for i = from:to
                this.Arr(i)
            end
        end
    end
end

