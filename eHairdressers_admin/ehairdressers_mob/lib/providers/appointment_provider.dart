import 'package:ehairdressers_mob/models/appointment.dart';
import 'base_provider.dart';

class AppointmentProvider extends BaseProvider<Appointment> {
  AppointmentProvider() : super("Appointment");

  @override
  Appointment fromJson(data) {
    // TODO: implement fromJson
    return Appointment.fromJson(data);
  }
}
