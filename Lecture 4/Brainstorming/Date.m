function new_d_vec = Date(d_vec, add_day)
    new_d_vec = d_vec;
    
    separated_day = SepDay(add_day, d_vec(1), d_vec(2));
    
    % If both the number of years and the number of months in the number of
    % days to be added is 0, then we are in the same month, so we add the
    % number of days to the current day. Otherwise, we start from a new
    % month, so the new day equals to the number of remaining days
    if separated_day(2) == 0 && separated_day(3) == 0
        new_d_vec(1) = new_d_vec(1) + separated_day(1);
    else
        new_d_vec(1) = separated_day(1);
    end
    
    % If the number of years in the number of days to be added equals to 0,
    % then we are in the same year, so we add the number of months to the
    % current month. Otherwise, we start from a new year, so the new month
    % equals to the number of months + 1. (If the number of months equals 
    % to 0, then we are at the first month of the year)
    if separated_day(3) == 0
        new_d_vec(2) = new_d_vec(2) + separated_day(2);
    else
        new_d_vec(2) = separated_day(2) + 1;
    end
    new_d_vec(3) = new_d_vec(3) + separated_day(3);
end

% This function calculates how many years, months, and days in the number 
% of days that is added to the current date
function separated_day = SepDay(add_day, curr_day, curr_month)
    day_vec = [31 28 31 30 31 30 31 31 30 31 30 31]; % Number of days in
    % each month from january to december
    
    iscurr_year = 1;
    num_year = 0; % Number of years
    
    curr_day_of_year = sum(day_vec(1 : curr_month - 1)) + curr_day; % Which
    % day of the year out of 365 days
    
    num_rem_day_of_curr_year = 365 - curr_day_of_year; % Number of remain-
    % ing days in the current year
    
    % If the number of days that is added to the current date equals to the
    % number of remaining days in the current year, the number of year
    % should be 0 since we will be on the last day of the current year
    % after the addition. Otherwise, calculate if there is a year in the
    % number days to be added
    if add_day == num_rem_day_of_curr_year
        quo = 0;
    else
        quo = floor(add_day / num_rem_day_of_curr_year);
    end
    
    % While there is at least one year in the remaining days to be added,
    % the calculation of the number of years will continue
    while quo ~= 0
        % If the loop just starts, it means that we are in the current year
        % and we need to subtract the number of remaining days in the
        % current year. Otherwise, every loop means a year which equals to
        % 365 days.
        if iscurr_year == 1
            add_day = add_day - num_rem_day_of_curr_year;
            iscurr_year = 0;
        else
            add_day = add_day - 365;
        end
        num_year = num_year + 1;
        if add_day == 365
            quo = 0;
        else
            quo = floor(add_day / 365);
        end
    end
    
    % If there is at least a year in the number of days to be added, the we
    % start calculating the number of months in the remaining days from day
    % 0 of the year so that there are 365 days left
    if num_year ~= 0
        curr_month = 1;
        curr_day = 0;
    end
    
    % The process of calculating the number of months is almost the same
    % with the number of years, however, in this case we are checking the
    % number of days in each month since they are different
    iscurr_month = 1;
    num_month = 0;
    new_day_vec = ShiftDayVec(curr_month);
    month_index = 1;
    num_rem_day_of_curr_month = new_day_vec(month_index) - curr_day;
    if add_day == num_rem_day_of_curr_month
        quo = 0;
    else
        quo = floor(add_day / num_rem_day_of_curr_month);
    end
    while quo ~= 0
        if iscurr_month == 1
            add_day = add_day - num_rem_day_of_curr_month;
            iscurr_month = 0;
        else
            add_day = add_day - new_day_vec(month_index);
        end
        num_month = num_month + 1;
        month_index = month_index + 1;
        if month_index > 12 || add_day == new_day_vec(month_index)
            quo = 0;
        else
            quo = floor(add_day / new_day_vec(month_index));
        end
    end
    
    num_rem_day = add_day;
    
    separated_day = [num_rem_day num_month num_year];
end

% This function constructs the vector of the number of days of each month
% from given month to the previous month of the given month
function new_day_vec = ShiftDayVec(start_month)
    day_vec = [31 28 31 30 31 30 31 31 30 31 30 31];
    new_day_vec = zeros(1, 12);
    for month_index = 1 : 12
        new_month_index = mod((month_index - (start_month - 1)), 12);
        if new_month_index == 0
            new_month_index = 12;
        end
        new_day_vec(new_month_index) = day_vec(month_index);
    end
end