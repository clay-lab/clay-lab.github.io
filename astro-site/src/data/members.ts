import fs from 'node:fs';
import path from 'node:path';
import yaml from 'js-yaml';

export interface Member {
  name: string;
  photo?: string;
  email?: string;
  url?: string;
  title?: string;
  location?: string;
  github?: string;
}

export interface MembersData {
  faculty: Member[];
  graduate: Member[];
  undergraduate: Member[];
  'post-doc-alumni': Member[];
  'phd-alumni': Member[];
  'undergrad-alumni': Member[];
}

const membersFilePath = path.join(process.cwd(), 'src', 'data', 'members.yml');

export const getMembersData = (): MembersData => {
  const content = fs.readFileSync(membersFilePath, 'utf8');
  const parsed = yaml.load(content) as MembersData;

  if (!parsed || typeof parsed !== 'object') {
    throw new Error('Invalid members data: expected object in src/data/members.yml');
  }

  return parsed;
};
