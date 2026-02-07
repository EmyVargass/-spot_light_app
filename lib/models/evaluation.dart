class Evaluation {
  final String? id;
  final String projectId;
  final String evaluatorId;
  final EvaluationScores scores;
  final double finalScore;
  final String feedback;
  final Map<String, dynamic>? aiAnalysis;

  Evaluation({
    this.id,
    required this.projectId,
    required this.evaluatorId,
    required this.scores,
    required this.finalScore,
    required this.feedback,
    this.aiAnalysis,
  });

  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      id: json['_id'] ?? json['id'],
      projectId: json['projectId'] ?? '',
      evaluatorId: json['evaluatorId'] ?? '',
      scores: EvaluationScores.fromJson(json['scores'] ?? {}),
      finalScore: (json['finalScore'] ?? 0.0).toDouble(),
      feedback: json['feedback'] ?? '',
      aiAnalysis: json['aiAnalysis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'evaluatorId': evaluatorId,
      'scores': scores.toJson(),
      'finalScore': finalScore,
      'feedback': feedback,
      if (aiAnalysis != null) 'aiAnalysis': aiAnalysis,
    };
  }
}

class EvaluationScores {
  final int innovation;
  final int functionality;
  final int ui;
  final int impact;

  EvaluationScores({
    required this.innovation,
    required this.functionality,
    required this.ui,
    required this.impact,
  });

  factory EvaluationScores.fromJson(Map<String, dynamic> json) {
    return EvaluationScores(
      innovation: json['innovation'] ?? 0,
      functionality: json['functionality'] ?? 0,
      ui: json['ui'] ?? 0,
      impact: json['impact'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'innovation': innovation,
      'functionality': functionality,
      'ui': ui,
      'impact': impact,
    };
  }

  double get total => (innovation + functionality + ui + impact).toDouble();
}
