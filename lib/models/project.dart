class Project {
  final String? id;
  final String title;
  final String category;
  final String description;
  final String videoUrl;
  final List<String> members;
  final ProjectStats stats;
  final DateTime createdAt;

  Project({
    this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.videoUrl,
    required this.members,
    required this.stats,
    required this.createdAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['_id'] ?? json['id'],
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      members: List<String>.from(json['members'] ?? []),
      stats: ProjectStats.fromJson(json['stats'] ?? {}),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'description': description,
      'videoUrl': videoUrl,
      'members': members,
      'stats': stats.toJson(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class ProjectStats {
  final double averageScore;
  final int totalVotes;

  ProjectStats({
    required this.averageScore,
    required this.totalVotes,
  });

  factory ProjectStats.fromJson(Map<String, dynamic> json) {
    return ProjectStats(
      averageScore: (json['averageScore'] ?? 0.0).toDouble(),
      totalVotes: json['totalVotes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'averageScore': averageScore,
      'totalVotes': totalVotes,
    };
  }
}
