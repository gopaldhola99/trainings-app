import '../models/training_model.dart';

final mockTrainings = [
  TrainingModel(
    id: 1,
    title: "Safe Scrum Master",
    time: "08:30 AM - 12:30 PM",
    date: "Oct 11 - 13, 2023",
    location: "Convention Hall, Greater Des Moines",
    image:
        "https://images.unsplash.com/photo-1552664730-d307ca884978?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: "\$825",
    isFillingFast: true,
    trainerProfile:
        'https://plus.unsplash.com/premium_photo-1663047504447-d54e624ef2d5?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    isEarlyBird: false,
    trainerName: 'John Doe',
  ),
  TrainingModel(
    id: 2,
    title: "Agile Coach Certification",
    time: "09:00 AM - 01:00 PM",
    date: "Oct 15 - 17, 2023",
    location: "Phoenix, AZ",
    image:
        "https://images.unsplash.com/photo-1646066490017-c935b1a1eb0f?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: "\$1200",
    trainerProfile:
        'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    isFillingFast: false,
    isEarlyBird: true,
    trainerName: 'Smith wills',
  ),
  TrainingModel(
    id: 3,
    title: "DevOps Practitioner",
    time: "01:00 PM - 04:00 PM",
    date: "Oct 20 - 22, 2023",
    trainerProfile:
        'https://plus.unsplash.com/premium_photo-1669882305273-674eff6567af?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    location: "Dallas, TX",
    image:
        "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: "\$950",
    isFillingFast: false,
    isEarlyBird: false,
    trainerName: 'Shane martin',
  ),
  TrainingModel(
    id: 4,
    title: "Certified Scrum Product Owner",
    time: "10:00 AM - 02:00 PM",
    date: "Oct 25 - 27, 2023",
    trainerProfile:
        'https://plus.unsplash.com/premium_photo-1670071482460-5c08776521fe?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    location: "San Francisco, CA",
    image:
        "https://plus.unsplash.com/premium_photo-1725400817468-ddb0135d865d?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: "\$1050",
    isFillingFast: true,
    isEarlyBird: false,
    trainerName: 'Michel wayne',
  ),
];
