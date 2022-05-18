mixin Queries {
  static String dispatchPushNotificatonRequest = '''
  mutation SendPushNotification (\$senderId: String!, \$recipientId: String!, \$senderUsername: String!, \$type: Float!){
    sendPushNotification(payload:{ senderId: \$senderId, recipientId:\$recipientId, type: \$type, senderUsername: \$senderUsername})  
  }
  ''';
}
