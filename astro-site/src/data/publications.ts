import fs from 'node:fs';
import path from 'node:path';
import yaml from 'js-yaml';

export interface Publication {
  title: string;
  authors: string;
  conference: string;
  pdf?: string;
  arXiv?: string;
  bibtex?: string;
  code?: string;
  image?: string;
}

interface PapersData {
  papers: Publication[];
}

const papersFilePath = path.join(process.cwd(), 'src', 'data', 'papers.yml');

export const getPublications = (): Publication[] => {
  const content = fs.readFileSync(papersFilePath, 'utf8');
  const parsed = yaml.load(content) as PapersData;

  if (!parsed || !Array.isArray(parsed.papers)) {
    throw new Error('Invalid publications data: expected "papers" array in src/data/papers.yml');
  }

  return parsed.papers;
};
