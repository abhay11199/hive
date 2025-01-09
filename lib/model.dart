class HiveModel {
  final int id;
  final String jsonrpc;
  final List<Result> result;

  HiveModel({
    required this.id,
    required this.jsonrpc,
    required this.result,
  });

  factory HiveModel.fromJson(Map<String, dynamic> json) {
    return HiveModel(
      id: json['id'],
      jsonrpc: json['jsonrpc'],
      result: json['result'] != null && json['result'] is List
          ? (json['result'] as List).map((e) => Result.fromJson(e)).toList()
          : [],
    );
  }
}

class Result {
  final List<ActiveVote> activeVotes;
  final String author;
  final String authorPayoutValue;
  final double authorReputation;
  final String authorRole;
  final String authorTitle;
  final List<Beneficiary> beneficiaries;
  final List<String> blacklists;
  final String body;
  final String category;
  final int children;
  final String community;
  final String communityTitle;
  final String created;
  final String curatorPayoutValue;
  final int depth;
  final bool isPaidout;
  final JsonMetadata jsonMetadata;
  final String maxAcceptedPayout;
  final int netRshares;
  final double payout;
  final String payoutAt;
  final String pendingPayoutValue;
  final int percentHbd;
  final String permlink;
  final int postId;
  final String promoted;
  final int reblogs;
  final List<Reply> replies;
  final Stats stats;
  final String title;
  final String updated;
  final String url;

  Result({
    required this.activeVotes,
    required this.author,
    required this.authorPayoutValue,
    required this.authorReputation,
    required this.authorRole,
    required this.authorTitle,
    required this.beneficiaries,
    required this.blacklists,
    required this.body,
    required this.category,
    required this.children,
    required this.community,
    required this.communityTitle,
    required this.created,
    required this.curatorPayoutValue,
    required this.depth,
    required this.isPaidout,
    required this.jsonMetadata,
    required this.maxAcceptedPayout,
    required this.netRshares,
    required this.payout,
    required this.payoutAt,
    required this.pendingPayoutValue,
    required this.percentHbd,
    required this.permlink,
    required this.postId,
    required this.promoted,
    required this.reblogs,
    required this.replies,
    required this.stats,
    required this.title,
    required this.updated,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      activeVotes: json['active_votes'] != null && json['active_votes'] is List
          ? (json['active_votes'] as List)
              .map((e) => ActiveVote.fromJson(e))
              .toList()
          : [],
      author: json['author'] ?? '',
      authorPayoutValue: json['author_payout_value'] ?? '',
      authorReputation: (json['author_reputation'] ?? 0).toDouble(),
      authorRole: json['author_role'] ?? '',
      authorTitle: json['author_title'] ?? '',
      beneficiaries:
          json['beneficiaries'] != null && json['beneficiaries'] is List
              ? (json['beneficiaries'] as List)
                  .map((e) => Beneficiary.fromJson(e))
                  .toList()
              : [],
      blacklists: json['blacklists'] != null && json['blacklists'] is List
          ? List<String>.from(json['blacklists'])
          : [],
      body: json['body'] ?? '',
      category: json['category'] ?? '',
      children: json['children'] ?? 0,
      community: json['community'] ?? '',
      communityTitle: json['community_title'] ?? '',
      created: json['created'] ?? '',
      curatorPayoutValue: json['curator_payout_value'] ?? '',
      depth: json['depth'] ?? 0,
      isPaidout: json['is_paidout'] ?? false,
      jsonMetadata: json['json_metadata'] != null
          ? JsonMetadata.fromJson(json['json_metadata'])
          : JsonMetadata(
              app: '',
              format: '',
              image: [],
              tags: [],
              users: [],
              thumbnail: [],
              description: ''),
      maxAcceptedPayout: json['max_accepted_payout'] ?? '',
      netRshares: json['net_rshares'] ?? 0,
      payout: (json['payout'] ?? 0).toDouble(),
      payoutAt: json['payout_at'] ?? '',
      pendingPayoutValue: json['pending_payout_value'] ?? '',
      percentHbd: json['percent_hbd'] ?? 0,
      permlink: json['permlink'] ?? '',
      postId: json['post_id'] ?? 0,
      promoted: json['promoted'] ?? '',
      reblogs: json['reblogs'] ?? 0,
      replies: json['replies'] != null && json['replies'] is List
          ? (json['replies'] as List).map((e) => Reply.fromJson(e)).toList()
          : [],
      stats: json['stats'] != null
          ? Stats.fromJson(json['stats'])
          : Stats(flagWeight: 0, gray: false, hide: false, totalVotes: 0),
      title: json['title'] ?? '',
      updated: json['updated'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

class ActiveVote {
  final int rshares;
  final String voter;

  ActiveVote({
    required this.rshares,
    required this.voter,
  });

  factory ActiveVote.fromJson(Map<String, dynamic> json) {
    return ActiveVote(
      rshares: json['rshares'] ?? 0,
      voter: json['voter'] ?? '',
    );
  }
}

class Beneficiary {
  final String account;
  final int weight;

  Beneficiary({
    required this.account,
    required this.weight,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      account: json['account'] ?? '',
      weight: json['weight'] ?? 0,
    );
  }
}

class JsonMetadata {
  final String app;
  final String description;
  final String format;
  final List<String> image;
  final List<String> tags;
  final List<String> thumbnail;

  final List<String> users;

  JsonMetadata({
    required this.app,
    required this.description,
    required this.format,
    required this.image,
    required this.tags,
    required this.thumbnail,
    required this.users,
  });

  factory JsonMetadata.fromJson(Map<String, dynamic> json) {
    return JsonMetadata(
      app: json['app'] ?? '',
      description: json['description'] ?? '',
      format: json['format'] ?? '',
      image: json['image'] != null && json['image'] is List
          ? List<String>.from(json['image'])
          : [],
      tags: json['tags'] != null && json['tags'] is List
          ? List<String>.from(json['tags'])
          : [],
      thumbnail: json['thumbnail'] != null && json['thumbnail'] is List
          ? List<String>.from(json['thumbnail'])
          : [],
      users: json['users'] != null && json['users'] is List
          ? List<String>.from(json['users'])
          : [],
    );
  }
}

class Stats {
  final double flagWeight;
  final bool gray;
  final bool hide;
  final int totalVotes;

  Stats({
    required this.flagWeight,
    required this.gray,
    required this.hide,
    required this.totalVotes,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      flagWeight: json['flag_weight'] ?? 0.0,
      gray: json['gray'] ?? false,
      hide: json['hide'] ?? false,
      totalVotes: json['total_votes'] ?? 0,
    );
  }
}

class Reply {
  final int id;
  final String value;

  Reply({
    required this.id,
    required this.value,
  });

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      id: json['id'] ?? 0,
      value: json['value'] ?? '',
    );
  }
}
