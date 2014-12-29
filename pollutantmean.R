pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' �ǳ���Ϊ1���ַ�������ָ��
    ## CSV�ļ���λ��
    
    ## 'pollutant' �ǳ���Ϊ1���ַ�������ָ��
    ## ��Ⱦ������ƣ����ǽ��������
    ## ƽ��ֵ; Ҫô�ǡ�������(sulfate)��Ҫô�ǡ�������(nitrate)��
    
    ## 'id'��������������ָ�������ID��
    ## ��Ҫ��Ҫʹ�õ�
    
    ## �����б��ڵ����м������Ⱦ��ƽ��ֵ��
    ## ��id�������е� (���� NAֵ)
    ans <- data.frame()
    ## �½�һ��df������õ�������
    for (item in id){
        if (item < 10)
            name <- paste("00", as.character(item), ".csv", sep="") 
        else if(item < 100)
            name <- paste("0", as.character(item), ".csv", sep="")
        else
            name <- paste(as.character(item), ".csv", sep="")
        path <- paste(directory, name, sep="/")
        ## path Ϊ��ȡ�ļ���·��
        data <- read.csv(path)
        ## data Ϊ��ȡ������
        need <- data[complete.cases(data[,pollutant]),]
        ans <- rbind(ans, need)
        ## ans ���ǰ���ǰ�����ݺ����ڵ����ݺϲ���һ��
        
        ## ����
        #print ("====================")
        #print (head(need))
        #print (nrow(need))
        #print (head(ans))
        #print ("====================")
    }
    round(mean(ans[,pollutant]),3)
}