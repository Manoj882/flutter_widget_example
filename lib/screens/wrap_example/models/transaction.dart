class Transaction {
    final String? campaignId;
    final DateTime? startDate;
    final DateTime? endDate;
    final int? isActive;
    final int? eligibleTxnCount;
    final int? txnCount;
    final String? title;
    final String? rewards;
    final String? type;
    final String? prizeImage;

    Transaction({
        this.campaignId,
        this.startDate,
        this.endDate,
        this.isActive,
        this.eligibleTxnCount,
        this.txnCount,
        this.title,
        this.rewards,
        this.type,
        this.prizeImage,
    });

}