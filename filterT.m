function [y, t] = filterT(ts, ys, target_ts)
    y = []; t = [];


    % loop through rows of ys and ts and check if any t in the respective
    % row is ~== to target_ts
    for i = 1:size(ts, 1)
        counter = 1;
        cur_trow = ts(i,:);
        cur_target_row = target_ts(i, :);
        for j = 1:size(cur_trow, 2)
            for k = 1:size(cur_target_row, 2)
                if abs(cur_target_row(k) - cur_trow(j)) < 1e-10
                    y(i, counter) = ys(i, j);
                    counter = counter + 1;
                end
            end
        end
    end
end