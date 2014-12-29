complete <- function(directory, id = 1:332) {
    ## 'directory' �ǳ���Ϊ1���ַ�������ָ��
    ##  CSV �ļ���λ��
    
    ## 'id' ��������������ָ�������ID�ţ�
    ## ��Ҫ��ʹ�õ�
    
    ## �������¸�ʽ������֡��
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## ����'id' �Ǽ���ID��ţ���'nobs'��
    ## ��������������
    ans <- data.frame()
    ## �½�һ��df������õ�������
    for(item in id){
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
        need <- nrow(data[complete.cases(data),])
        ## need Ϊɸѡ���ݺ������
        temp <- data.frame(id=item, nobs=need)
        ans <- rbind(ans, temp)
    }
    ans
}