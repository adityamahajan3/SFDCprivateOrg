public with sharing class Mar27IterableIteratorBatch implements Database.Batchable<Integer>, Iterable<Integer>, Iterator<Integer> {
    private List<Integer> data;
    private Integer index = 0;
    public Mar27IterableIteratorBatch(List<Integer> values) {
        this.data = values;
    }
    public Iterable<Integer> start(Database.BatchableContext bc){
        return this;
    }
    public void execute(Database.BatchableContext bc, List<Integer> scope){
        for(Integer val : scope){
            System.debug(val);
        }
    }
    public void finish(Database.BatchableContext bc){
        //Do any post batch processing here
    }
    public Iterator<Integer> iterator() {
        return this; 
    }
    public Boolean hasNext() {
        return index < data.size();
    }
    public Integer next() {
        if (hasNext()) {
            Integer result = data[index];
            index++;
            return result;
        } else {
            throw new NoSuchElementException('No more elements in the iterator.');
        }
    }
    public void remove() {
        throw new UnsupportedOperationException('remove() is not supported'); 
    }
}

/*
List<Integer> values = new List<Integer>{1,2,3,4,5};
Mar27IterableIteratorBatch M = new Mar27IterableIteratorBatch(values);
Database.executeBatch(M,1);
*/