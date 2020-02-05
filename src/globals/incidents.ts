
export class Provider{
    name: string;
    match_id: string;
    source: string;
    source_file: string;
    pushed: string;
}

export class Id{
    home: string;
    sport: string;
    event_group_name: string;
    away: string;
    start_time: string;
}

export class Arguments{
    season?: string;
    whistle_start_time?: string;
    whistle_end_time?: string;
    away_score?: string;
	home_score?: string;
}

export class Incident{
    unique_string: string;
    timestamp: string;
    arguments: Arguments;
    call: string;
    id: Id;
    provider_info: Provider;
}
