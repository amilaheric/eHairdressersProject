// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      json['appointmentId'] as int?,
      json['employeeId'] as int?,
      json['userId'] as int?,
      json['serviceId'] as int?,
      json['comment'] as String?,
      json['employeeName'] as String?,
      json['username'] as String?,
      json['serviceName'] as String?,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'employeeId': instance.employeeId,
      'userId': instance.userId,
      'serviceId': instance.serviceId,
      'comment': instance.comment,
      'employeeName': instance.employeeName,
      'username': instance.username,
      'serviceName': instance.serviceName,
    };
