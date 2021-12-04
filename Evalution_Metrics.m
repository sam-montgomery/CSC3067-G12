function [recall, precision, specificity, f_measure, false_alarm_rate] = Evalution_Metrics(TP, FP, TN, FN)

for i=1:length(TP)
    recall(i) = TP(i)/(TP(i)+FN(i));
    precision(i) = TP(i)/(TP(i)+FP(i));
    specificity(i) = TN(i)/(TN(i)+FP(i));
    f_measure(i) = (2*TN(i))/(2*TP(i)+FN(i)+FP(i));
    false_alarm_rate(i) = FP(i)/(FP(i)+TN(i));
end




end